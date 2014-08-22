From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: apalis/colibri t30: fix on-module 5v0 supplies
Date: Fri, 22 Aug 2014 13:26:10 -0600
Message-ID: <53F79952.6060002@wwwdotorg.org>
References: <cbf0902cd98332bc0218d84fd055b42fab3ea3b2.1408719375.git.marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cbf0902cd98332bc0218d84fd055b42fab3ea3b2.1408719375.git.marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/22/2014 09:06 AM, Marcel Ziswiler wrote:
> Working on Gigabit/PCIe support in U-Boot for Apalis T30 I realised
> that the current device tree source includes for our modules only
> happen to work due to referencing the on-carrier 5v0 supply from USB
> which is not at all available on-module. The modules actually contain
> TPS60150 charge pumps to generate the PMIC required 5 volts from the
> one and only 3.3 volt module supply. This patch fixes this.

I've forwarded this to the ARM SoC maintainers as a fix for v3.17.
