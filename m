From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 2/3] of: add vendor prefix for GMT
Date: Thu, 12 Sep 2013 08:58:21 -0600
Message-ID: <5231D68D.3000200@wwwdotorg.org>
References: <1378985061-28547-1-git-send-email-wni@nvidia.com> <1378985061-28547-3-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1378985061-28547-3-git-send-email-wni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wei Ni <wni@nvidia.com>
Cc: khali@linux-fr.org, linux@roeck-us.net, broonie@kernel.org, lm-sensors@lm-sensors.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09/12/2013 05:24 AM, Wei Ni wrote:
> Adding Global Mixed-mode Technology Inc. to the list
> of devicetree vendor prefixes.

> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt

> +gmt	Global Mixed-mode Technology Inc.

There's some opportunity for confusion here re: the GMT timezone, but
GMT seems to be what the company abbreviates itself to on their website,
so I guess this is reasonable.

Acked-by: Stephen Warren <swarren@nvidia.com>
