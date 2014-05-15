From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 3/3] ARM: tegra: initial add of Colibri T30
Date: Thu, 15 May 2014 12:37:55 -0600
Message-ID: <53750983.3080705@wwwdotorg.org>
References: <cover.1400103181.git.stefan@agner.ch> <a8f01e573dcb7d563833ddcda30567e8ac7626ed.1400103181.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <a8f01e573dcb7d563833ddcda30567e8ac7626ed.1400103181.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stefan-XLVq0VzYD2Y@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/14/2014 03:45 PM, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
> From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> This patch adds the device tree to support Toradex Colibri T30, a
> computer on module which can be used on different carrier boards.
> 
> The module consists of a Tegra 30 SoC, two PMIC, DDR3L RAM, eMMC,
> a LM95245 temperature sensor and an AX88772B USB Ethernet
> Controller. Furthermore, there is a STMPE811 and SGTL5000 audio
> codec which are not yet supported. Anything that is not self
> contained on the module is disabled by default.
> 
> The device tree for the Evaluation Board includes the modules
> device tree and enables the supported pheripherials of the carrier
> board (the Evaluation Board supports almost all of them).

I've applied this to Tegra's for-3.16/dt branch.

A changelog in each individual patch would be useful. Splitting out
patches for the DRM tree and the Tegra tree into different series would
be useful. In this case, they don't depend on each-other.
