From: Alex Courbot <acourbot@nvidia.com>
Subject: Re: [RFC PATCH 8/9] ARM: dt: t30 cardhu: add dt entry for thermal
 driver
Date: Tue, 19 Feb 2013 12:42:57 +0900
Message-ID: <5122F4C1.9050108@nvidia.com>
References: <1361187031-3679-1-git-send-email-wni@nvidia.com> <1361187031-3679-9-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1361187031-3679-9-git-send-email-wni@nvidia.com>
Sender: linux-pm-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: "durgadoss.r@intel.com" <durgadoss.r@intel.com>, "rui.zhang@intel.com" <rui.zhang@intel.com>, Matthew Longnecker <MLongnecker@nvidia.com>, "khali@linux-fr.org" <khali@linux-fr.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "lm-sensors@lm-sensors.org" <lm-sensors@lm-sensors.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-kernel@vger.kernel.orgrs.org" <linux-kernel@vger.kernel.orgrs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On 02/18/2013 08:30 PM, Wei Ni wrote:
> diff --git a/Documentation/devicetree/bindings/thermal/tegra3-thermal.txt b/Documentation/devicetree/bindings/thermal/tegra3-thermal.txt
> new file mode 100644

This should go with the previous patch (which introduces the driver) 
instead of this one. Bindings should be documented with their driver.

Alex.

