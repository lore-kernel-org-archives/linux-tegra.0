From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Fri, 11 Oct 2013 16:43:57 -0600
Message-ID: <52587F2D.9070007@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-28-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381134884-5816-28-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 02:34 AM, Thierry Reding wrote:
> The gr2d hardware in Tegra114 is compatible with that of Tegra20 and
> Tegra30. No functionaly changes are required.

Similarly here, if the HW is 100% backwards-compatible, there's no need
to add compatible values to the driver.
