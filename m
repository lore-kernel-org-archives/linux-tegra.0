From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra124 powergate support
Date: Fri, 13 Dec 2013 10:40:40 -0700
Message-ID: <52AB4698.807@wwwdotorg.org>
References: <1386952264-6773-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1386952264-6773-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/13/2013 09:31 AM, Thierry Reding wrote:
> Three new gates have been added for Tegra124: SOR, VIC and IRAM. In
> addition, PCIe and SATA gates are again supported, like on Tegra20 and
> Tegra30.

I've applied the series to Tegra's for-3.14/soc branch.
