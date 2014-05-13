From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: enable MCP251x CAN controller and DS1307
 RTC
Date: Tue, 13 May 2014 13:57:14 -0600
Message-ID: <5372791A.4080909@wwwdotorg.org>
References: <cover.1400001937.git.stefan@agner.ch> <77cfca0a1769d867c8d2919f0040fbd785940fef.1400001937.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <77cfca0a1769d867c8d2919f0040fbd785940fef.1400001937.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: stefan-XLVq0VzYD2Y@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/13/2014 11:27 AM, stefan-XLVq0VzYD2Y@public.gmane.org wrote:
> From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
> 
> Toradex Colibri Evaluation Board uses the DS1307 RTC and the
> MCP251x CAN controller. The NVIDIA Tegra 3 based Colibri T30
> module can be used on this carrier board, hence enable those
> drivers in tegra_defonfig.
> 
> Furthermore the NVIDIA Tegra 3 based Apalis T30 module too
> contains two MCP251x CAN controller.

I have squashed this patch into Tegra's for-3.16/defconfig branch.

Can you please also send a patch to enable the same options in
multi_v7_defconfig. Send that to arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org (it's an alias for the
armsoc tree maintainers). That will ensure that anyone using that config
will also get these changes.

Thanks.
