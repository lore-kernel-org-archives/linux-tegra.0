From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/tegra: Fix crash caused by reference count imbalance
Date: Tue, 17 May 2016 18:29:22 +0100
Message-ID: <573B54F2.4010300@nvidia.com>
References: <1463502435-29217-1-git-send-email-jonathanh@nvidia.com>
 <20160517164632.GT27098@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160517164632.GT27098-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/05/16 17:46, Daniel Vetter wrote:
> On Tue, May 17, 2016 at 05:27:15PM +0100, Jon Hunter wrote:
>> Commit d2307dea14a4 ("drm/atomic: use connector references (v3)") added
>> reference counting for DRM connectors and this caused a crash when
>> exercising system suspend on Tegra114 Dalmore.
>>
>> The Tegra DSI driver implements a Tegra specific function,
>> tegra_dsi_connector_duplicate_state(), to duplicate the connector state
>> and destroys the state using the generic helper function,
>> drm_atomic_helper_connector_destroy_state(). Following commit
>> d2307dea14a4 ("drm/atomic: use connector references (v3)") there is
>> now an imbalance in the connector reference count because the Tegra
>> function to duplicate state does not take a reference when duplicating
>> the state information. However, the generic helper function to destroy
>> the state information assumes a reference has been taken and during
>> system suspend, when the connector state is destroyed, this leads to a
>> crash because we attempt to put the reference for an object that has
>> already been freed.
>>
>> Fix this by aligning tegra_dsi_connector_duplicate_state() with commit
>> d2307dea14a4 ("drm/atomic: use connector references (v3)"), so that we
>> take a reference on a connector if crtc is set.
>>
>> By fixing tegra_dsi_connector_duplicate_state() to take a reference,
>> although a crash was no longer seen, it was then observed that after
>> each system suspend-resume cycle, the reference would be one greater
>> than before the suspend-resume cycle. Following commit d2307dea14a4
>> ("drm/atomic: use connector references (v3)"), it was found that we
>> also need to put the reference when calling the function
>> tegra_dsi_connector_reset() before freeing the state. Fix this by
>> updating tegra_dsi_connector_reset() to call the function
>> __drm_atomic_helper_connector_destroy_state() in order to put the
>> reference for the connector.
>>
>> Finally, add a warning if allocating memory for the state information
>> fails in tegra_dsi_connector_reset().
>>
>> Fixes: d2307dea14a4 ("drm/atomic: use connector references (v3)")
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dsi.c | 16 ++++++++++++----
>>  1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
>> index 44e102799195..68aaa4c33cd8 100644
>> --- a/drivers/gpu/drm/tegra/dsi.c
>> +++ b/drivers/gpu/drm/tegra/dsi.c
>> @@ -745,13 +745,18 @@ static void tegra_dsi_soft_reset(struct tegra_dsi *dsi)
>>  
>>  static void tegra_dsi_connector_reset(struct drm_connector *connector)
>>  {
>> -	struct tegra_dsi_state *state =
>> -		kzalloc(sizeof(*state), GFP_KERNEL);
>> +	struct tegra_dsi_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
>>  
>> -	if (state) {
>> +	if (WARN_ON(!state))
>> +		return;
>> +
>> +	if (connector->state) {
>> +		__drm_atomic_helper_connector_destroy_state(connector,
>> +							    connector->state);
>>  		kfree(connector->state);
>> -		__drm_atomic_helper_connector_reset(connector, &state->base);
>>  	}
>> +
>> +	__drm_atomic_helper_connector_reset(connector, &state->base);
> 
> Please rebase onto drm-misc or linux-next, I've removed the connector
> argument from __drm_atomic_helper_connector_destroy_state(). I'll send the
> pull request for that later today to Dave.

OK. This is based upon next-20160516 and so I will update to today's.

>>  }
>>  
>>  static struct drm_connector_state *
>> @@ -764,6 +769,9 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
>>  	if (!copy)
>>  		return NULL;
>>  
>> +	if (copy->base.crtc)
>> +		drm_connector_reference(connector);
>> +
> 
> Please use __drm_atomic_helper_connector_duplicate_state instead of
> open-coding it.

Unfortunately, tegra is allocating and duplicating memory for the entire
tegra_dsi_state structure (of which drm_connector_state is a member) in
this function and so I was not able to do that. However, may be Thierry
can comment on whether that is completely necessary and if we can move
to using __drm_atomic_helper_connector_duplicate_state() instead.

Cheers
Jon

-- 
nvpublic
