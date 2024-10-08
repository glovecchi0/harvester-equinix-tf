# harvester-equinix-tf

Terrafom modules for deploying Harvester on Equinix infrastructure.

## How the repository is structured

```
.
├── modules/
│   ├── infrastructure
│   ├── network
│   └── virtual-machines
├── examples/
│   ├── custom-vm-network
│   ├── rke2-on-harvester
│   ├── nv-cluster-on-harvester
│   └── README.md
├── README.md
├── opentofu.md
├── terraform.md
├── versions.md
└── .gitignore

```

## Examples Overview

### custom-vm-network

**Modules used:**
- `infrastructure`
- `network`

**Goal:** Deploy three Bare Metal Servers on Equinix using the Harvester ISO, creating a three-node Harvester cluster (with default variables and any required customizations). Then, add an additional [Cluster Network](https://docs.harvesterhci.io/v1.3/networking/index/) on top of the management network.

### rke2-on-harvester

**Modules used:**
- `infrastructure`
- `virtual-machines`

**Goal:** Deploy three Bare Metal Servers on Equinix using the Harvester ISO, creating a three-node Harvester cluster. Then, create three Ubuntu Virtual Machines and install an RKE2 cluster (a three-controller Kubernetes cluster).

### nv-cluster-on-harvester

**Modules used:**
- `infrastructure`
- `virtual-machines`

**Goal:** Deploy three Bare Metal Servers on Equinix using the Harvester ISO, creating a three-node Harvester cluster. Then, create three Ubuntu Virtual Machines, install an RKE2 cluster (a three-controller Kubernetes cluster), and deploy NeuVector.
