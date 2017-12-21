From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] drm/tegra: dc: Implement legacy blending
Date: Thu, 21 Dec 2017 22:13:05 +0300
Message-ID: <cffaa2f8-42f4-557f-1824-a42fdca54aaa@gmail.com>
References: <20171221140317.18447-1-thierry.reding@gmail.com>
 <3ccf0299-95d9-0c46-dd86-de16434b6e42@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3ccf0299-95d9-0c46-dd86-de16434b6e42-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 21.12.2017 21:46, Dmitry Osipenko wrote:
> On 21.12.2017 17:03, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This implements alpha blending on legacy display controllers (Tegra20,
>> Tegra30 and Tegra114). While it's theoretically possible to support the
>> zpos property to enable userspace to specify the Z-order of each plane
>> individually, this is not currently supported and the same fixed Z-
>> order as previously defined is used.
>>
>> Reverts commit 71835caa00e8 ("drm/tegra: fb: Force alpha formats") since
>> the opaque formats are now supported.
>>
>> Reported-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Fixes: 7772fdaef939 ("drm/tegra: Support ARGB and ABGR formats")
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---

[snip]

>> +
>> +void tegra_plane_check_dependent(struct tegra_plane *tegra,
>> +				 struct tegra_plane_state *state)
>> +{
>> +	struct drm_plane_state *old, *new;
>> +	struct drm_plane *plane;
>> +	unsigned int zpos[2];
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < 3; i++)
>> +		state->dependent[i] = false;
>> +
>> +	for (i = 0; i < 2; i++)
>> +		zpos[i] = 0;
>> +
>> +	for_each_oldnew_plane_in_state(state->base.state, plane, old, new, i) {
> 
> Somehow this works when 2 windows are blended (primary plane + cursor). But
> unfortunately this doesn't work at all in a case when 3 windows blended (primary
> + video overlay + cursor), for some reason there is only one plane in the state
> here, so blending dependency tracking doesn't work at all. I'll continue to look
> into it, but for now I don't know why it doesn't work as expected. If you have
> any idea, please tell.

Actually, I think this code only works when all planes are updated in a single
commit. We need to handle cases when only some of the active planes are
adjusting the state.

[snip]
