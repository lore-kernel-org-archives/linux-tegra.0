From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH 01/10] arm/tegra: initial device tree for tegra30
Date: Thu, 17 Nov 2011 11:39:14 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740D74C46@HQMAIL01.nvidia.com>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
 <1321546766-26770-2-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1321546766-26770-2-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Thursday, November 17, 2011 9:19 AM:
> This patch adds the initial device tree for tegra30

> diff --git a/Documentation/devicetree/bindings/arm/tegra.txt
...
> +* harmony: tegra20 based development board
> +Required root node properties:
> + - compatible = "nvidia,harmony", "nvidia,tegra20";
> +
> +* seaboard: tegra20 based clamshell reference design
> +Required root node properties:
> + - compatible = "nvidia,seaboard", "nvidia,tegra20";

Do we really want to list all the board names here? In the future, there
could be tens or hundreds. I would argue that we should just document
nvidia,tegra20 and nvidia,tegra30.

At a later point, we should fix board-dt.c to solely look for those
compatible values, although this will have to wait until the pinmux DT
bindings are present. Then, the kernel won't care about the board names.

-- 
nvpublic

