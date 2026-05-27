# control-plane

Monorepo for the DCM control plane.

## Layout

```text
cmd/control-plane/          # server entrypoint (skeleton)
internal/catalog/           # catalog manager domain (placeholder)
internal/placement/         # placement manager domain (placeholder)
internal/policy/            # policy manager domain (placeholder)
internal/serviceprovider/   # service provider manager domain (placeholder)
api/                        # OpenAPI specs (to be added)
deploy/                     # deployment assets (to be added)
```

See the [control plane monolith enhancement](https://github.com/dcm-project/enhancements/tree/main/enhancements/control-plane-monolith).

## Development

```bash
make build
make test
make lint
```
