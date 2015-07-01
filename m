From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 10/12] drm/tegra: Suspend dc/dsi/panel in one-shot
 mode
Date: Wed, 1 Jul 2015 17:03:17 +0800
Message-ID: <5593ACD5.2090403@nvidia.com>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com> <1435738915-31973-11-git-send-email-markz@nvidia.com> <20150701090005.GC24055@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150701090005.GC24055-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/01/2015 05:00 PM, Daniel Vetter wrote:
> On Wed, Jul 01, 2015 at 04:21:53PM +0800, Mark Zhang wrote:
>> @@ -756,7 +752,11 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
>>  }
>>  
>>  static const struct drm_connector_funcs tegra_dsi_connector_funcs = {
>> -	.dpms = tegra_dsi_connector_dpms,
>> +	/*
>> +	 * drm_atomic_helper_connector_dpms only handles DPMS ON/OFF,
>> +	 * so use drm_helper_connector_dpms instead.
>> +	 */
>> +	.dpms = drm_helper_connector_dpms,
> 
> Nope, mixing legacy dpms handling into an atomic driver is a no-go. You
> need to use drm_atomic_helper_connector_dpms here.

yeah, so I have to change "drm_atomic_helper_connector_dpms"?

Mark
> -Daniel
> 
