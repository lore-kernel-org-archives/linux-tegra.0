From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 00/11] tegra: Changes for v5.8-rc1
Date: Fri, 15 May 2020 16:53:00 +0200
Message-ID: <20200515145311.1580134-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, soc-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

This set of pull requests contains a couple more driver changes than
usual, which is primarily because of some build-time and runtime
dependencies.

The biggest driver here is probably the VI/CSI driver for Tegra210
which has been extensively been reviewed on the mailing list and was
acked by two of the subsystem maintainers.

Other than that there's CPU frequency scaling work and CPU idle support
for older chips, both of which have also been acked by the corresponding
maintainers. There are also three patches to core OF support which Rob
also acked and which are a build-time dependency for the Tegra210 EMC
frequency scaling patches.

The rest is pretty standard stuff.

For last cycle you had asked subarch maintainers to help with fleshing
out pull request details. Is this something that you wanted to pursue
for this cycle as well?

Thierry
