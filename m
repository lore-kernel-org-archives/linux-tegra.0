From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] of: reserved-memory: Various improvements
Date: Fri,  3 Apr 2020 20:56:36 +0200
Message-ID: <20200403185640.118569-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Hi Rob, all,

this is a set of patches that I've been working on to allow me to use
reserved memory regions more flexibly. One of the use-cases that I have
is an external memory controller driver that gets passed one or two
tables from firmware containing a set of EMC frequencies and the
corresponding register values to program for these frequencies.

One of these tables is the "nominal" table and an optional second table
is "derated" and is used when the DRAM chips are overheating. I want to
be able to pass these tables as separate memory-region entries.

So what this small patchset does is make the reserved-memory code adapt
to this situation better. On one hand, while the DT bindings currently
support multiple regions per device tree node, it's slightly unintuitive
to specify them. The first patch adds a memory-region-names property
that allows the DT to specify a "consumer" name for these regions much
like we do for things like clocks, resets or the reg property. At the
same time, a new alias for memory-region, named memory-regions, is
introduced to make this more consistent with other bindings.

Patches 2 and 3 add support in the core OF reserved-memory code for
these binding changes, with a fallback to the memory-region property if
no memory-regions property exists.

Patch 4 implements support for releasing multiple regions assigned to a
single device rather than just the first.

Thierry

Thierry Reding (4):
  dt-bindings: reserved-memory: Introduce memory-region{s,-names}
  of: reserved-memory: Support memory-regions property
  of: reserved-memory: Support lookup of regions by name
  of: reserved-memory: Support multiple regions per device

 .../reserved-memory/reserved-memory.txt       | 12 +++--
 drivers/of/of_reserved_mem.c                  | 52 +++++++++++++------
 include/linux/of_reserved_mem.h               | 11 ++++
 3 files changed, 55 insertions(+), 20 deletions(-)

-- 
2.24.1
