From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: ERROR: Bad of_node_put() on /timer@60005000
Date: Wed, 19 Jun 2013 09:32:17 -0600
Message-ID: <51C1CF01.7080606@wwwdotorg.org>
References: <20130619.111837.2022797543173602143.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130619.111837.2022797543173602143.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/19/2013 02:18 AM, Hiroshi Doyu wrote:
> Hi,
> 
> With CONFIG_OF_DYNAMIC enabled, I got the following. Is this a known issue?

Well, that option isn't enabled in tegra_defconfig so it's unlikely
anyone working on Tegra would have run into it. Best ask on the ARM or
devicetree-discuss mailing list if you want, or just send a patch to fix it.
