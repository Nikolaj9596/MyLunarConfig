local ls = require "luasnip"
local s = ls.snippet
local i = ls.insert_node
local extras = require "luasnip.extras"
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt

-- Python register resources
ls.add_snippets("python", {
  s(
    "frr",
    fmt(
      [[
def register_{}_resources(container: punq.Container) -> None:
    container.register(service={}.service.{}Service)
    container.register(service={}.repository.{}Repository)
    container.register(service={}.router.{}Router)
  ]],
      {
        i(1, "base"),
        i(2, "api_base"),
        i(3, "Base"),
        rep(2),
        rep(3),
        rep(2),
        rep(3),
      }
    )
  ),
})

-- Python fastapi router
ls.add_snippets("python", {
  s(
    "pfr",
    fmt(
      [[
import fastapi

class {}Router:
    def __init__(self, service: service.{}Service):
        self._service = service

    @property
    def router(self) -> fastapi.APIRouter:
        router = fastapi.APIRouter(
            prefix="/{}", default_response_class=fastapi.responses.ORJSONResponse
        )
        self._include_router(router)
        return router

    def _include_router(self, router: fastapi.APIRouter) -> None:
        ...
  ]],
      {
        i(1, "Base"),
        rep(1),
        i(2, "prefix"),
      }
    )
  ),
})

-- Python repository
ls.add_snippets("python", {
  s(
    "pr",
    fmt(
      [[
from app.core import database
from app.core.database import models
import sqlalchemy
import typing


class {}Repository:
    def __init__(self, db: database.Database):
        self._db = db
  ]],
      {
        i(1, "Base"),
      }
    )
  ),
})

-- Python service
ls.add_snippets("python", {
  s(
    "ps",
    fmt(
      [[

class {}Service:
    def __init__(self, repository: repository.{}Repository):
        self._repository = repository
  ]],
      {
        i(1, "Base"),
        rep(1),
      }
    )
  ),
})

-- Python function
ls.add_snippets("python", {
  s(
    "fn",
    fmt(
      [[
def {}({}) -> {}:
    return {}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, "None"),
        i(4, "None"),
      }
    )
  ),
})

-- Python async function
ls.add_snippets("python", {
  s(
    "afn",
    fmt(
      [[
async def {}({}) -> {}:
    return {}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, "None"),
        i(4, "None"),
      }
    )
  ),
})

-- Python django class
ls.add_snippets("python", {
  s(
    "cdm",
    fmt(
      [[
class {}({}):
    objects = models.Manager
    created = models.DateTimeField(
        verbose_name='Дата создания', auto_now_add=True)
    updated = models.DateTimeField(
        verbose_name='Дата изменения', auto_now=True)
    {}

    def __str__(self):
        return {}

    class Meta:
        verbose_name = "{}"
        verbose_name_plural = "{}"
        order_by = ["{}"]
  ]],
      {
        i(1, "ClassName"),
        i(2, "models.Model"),
        i(3, "# [TODO enter fields]"),
        i(4, "[TODO enter representation name]"),
        i(5, "[TODO enter verbose name]"),
        i(6, "[TODO enter verbose name plural]"),
        i(7, "[TODO enter order_by field]"),
      }
    )
  ),
})

-- Python serializer class
ls.add_snippets("python", {
  s(
    "cs",
    fmt(
      [[

class {}Serializer(serializers.Serializer):
    """
    {}
    """
    {}

    class Meta:
        fields = '__all__'

  ]],
      {
        i(1, "ClassName"),
        i(2, "[TODO enter description]"),
        i(3, "# [TODO enter fields]"),
      }
    )
  ),
})

-- Python serializer class model
ls.add_snippets("python", {
  s(
    "cms",
    fmt(
      [[

class {}Serializer(serializers.ModelSerializer):
    """
    {}
    """
    {}

    class Meta:
        model = {}
        fields = '__all__'

  ]],
      {
        i(1, "ClassName"),
        i(2, "[TODO enter description]"),
        i(3, "# [TODO enter fields]"),
        rep(1),
      }
    )
  ),
})

-- Python viewset class
ls.add_snippets("python", {
  s(
    "cv",
    fmt(
      [[

class {}ViewSet(viewsets.GenericViewSet):
    """{}"""

    queryset = {}.objects.all()
    serializer_class = {}Serializer
    permission_classes = [{}]
    filter_class = {}FilterSet
    filter_backends = (
        DjangoFilterBackend, filters.SearchFilter, filters.SearchFilter
    )
    search_fields = ({},)
    order_fields = ({},)

  ]],
      {
        i(1, "ClassName"),
        i(2, "[TODO enter description]"),
        rep(1),
        rep(1),
        i(3, "# [TODO enter permission classes]"),
        rep(1),
        i(3, "# [TODO enter search fields]"),
        i(3, "# [TODO enter order fields]"),
      }
    )
  ),
})

-- Python viewset action
ls.add_snippets("python", {
  s(
    "va",
    fmt(
      [[

    @action(
        detail=False, methods=['{}'],
        url_path=r'{}/(?P<{}>\d+)',
        serializer_class={},
        permission_classes=[{}]
    )
    def {}(self, request, {}):
        return Response(status=status.{})

  ]],
      {
        i(1, "GET"),
        i(2, "Path"),
        i(2, "pk"),
        i(3, "MySerializerClass"),
        i(3, "[MyPermissionClass]"),
        i(3, "action_name"),
        i(3, "pk: int"),
        i(3, "HTTP_200_OK"),
      }
    )
  ),
})

-- Python Django get queryset
ls.add_snippets("python", {
  s(
    "gqs",
    fmt(
      [[
    def get_queryset(self):
        queryset = super().get_queryset()
        return queryset
  ]],
      {}
    )
  ),
})

-- Python Django get permissions
ls.add_snippets("python", {
  s(
    "gpc",
    fmt(
      [[
    def get_permissions(self):
        permissions = None
        if self.action == '{}':
            permissions = {} | {}
        return [permissions()] if permissions else super().get_permissions()
  ]],
      {
        i(1, "[TODO enter action name]"),
        i(2, "[TODO enter permission class]"),
        i(3, "[TODO enter permission class]"),
      }
    )
  ),
})

-- Python Django get serializer_class
ls.add_snippets("python", {
  s(
    "gsc",
    fmt(
      [[
    def get_serializer_class(self):
        if self.action == '{}':
            return {}
        return super().get_serializer_class()
  ]],
      {
        i(1, "[TODO enter action name]"),
        i(2, "[TODO enter serilizer class]"),
      }
    )
  ),
})

ls.add_snippets("python", {
  s(
    { trig = "#i", snippetType = "autosnippet" },
    fmt(
      [[
# INFO: {}
      ]],
      {
        i(1, "Comment"),
      }
    )
  ),
})

ls.add_snippets("python", {
  s(
    { trig = "#t", snippetType = "autosnippet" },
    fmt(
      [[
# TODO: {}
      ]],
      {
        i(1, "Comment"),
      }
    )
  ),
})

ls.add_snippets("python", {
  s(
    { trig = "#w", snippetType = "autosnippet" },
    fmt(
      [[
# WARNING: {}
      ]],
      {
        i(1, "Comment"),
      }
    )
  ),
})
