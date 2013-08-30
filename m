From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC 0/3] drm: Add panel support
Date: Fri, 30 Aug 2013 17:25:18 +0200
Message-ID: <1377876321-26835-1-git-send-email-treding@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

This patch series adds support for panels to DRM. The current implementation
is very basic and only provides hooks for a panel to handle DPMS changes and
return a list of supported modes. That should be enough to support a rather
large number of panels. It should also be easy to extend the framework for
more sophisticated panels such as DSI.

I'm aware of the existing efforts to create such a framework, called CDF. My
impression was that a lot of people thought it overengineered and that it
doesn't fit well into the existing DRM infrastructure. This alternative
proposal is an attempt to start with something simpler (yet extensible) that
fits into DRM more nicely.

Patch 1 adds the "framework" if one can call it that. At the moment it isn't
anything more than a global registry that panel drivers can register panels
with and display drivers can retrieve them. All of this is very device tree
centric right now, but it shouldn't be difficult to add support for platform
data.

Patch 2 implements a simple driver for dumb panels that can have a regulator
for the supply voltage of the panel and a separate GPIO to enable the panel.
Three simple panels are currently supported by that driver.

Finally patch 3 hooks up the panel framework with the Tegra DRM driver. Note
that the framework isn't tied to the core at the moment. That can easily be
changed if we want to, but I didn't see a need so far. Instead the driver
calls the .dpms() and .get_modes() hooks in it's encoder/connector
implementation.

Thierry

Thierry Reding (3):
  drm: Add panel support
  drm/panel: Add simple panel support
  drm/tegra: Implement panel support

 .../devicetree/bindings/panel/panel-simple.txt     |  25 ++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   2 +
 drivers/gpu/drm/drm_panel.c                        |  96 ++++++
 drivers/gpu/drm/panel/Kconfig                      |  17 ++
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-simple.c               | 335 +++++++++++++++++++++
 drivers/gpu/host1x/drm/Kconfig                     |   1 +
 drivers/gpu/host1x/drm/drm.h                       |   1 +
 drivers/gpu/host1x/drm/output.c                    |  28 +-
 include/drm/drm_panel.h                            |  65 ++++
 11 files changed, 571 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/panel/panel-simple.txt
 create mode 100644 drivers/gpu/drm/drm_panel.c
 create mode 100644 drivers/gpu/drm/panel/Kconfig
 create mode 100644 drivers/gpu/drm/panel/Makefile
 create mode 100644 drivers/gpu/drm/panel/panel-simple.c
 create mode 100644 include/drm/drm_panel.h

-- 
1.8.4
