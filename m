From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1] drm/modes: Skip invalid cmdline mode
Date: Wed, 10 Jul 2019 18:05:18 +0300
Message-ID: <e7d78307-4a48-45b1-ffbe-bc397fec0e40@gmail.com>
References: <20190709145151.23086-1-digetx@gmail.com>
 <20190710101229.54ufuhmh22dfxclr@flea>
 <4ad69d15-07f8-9753-72d6-a51402c94c20@gmail.com>
 <20190710125552.qvmnh6qs63ikiu2k@flea>
 <f530844d-70f2-c3cc-d5f6-b435f1dbdfd2@gmail.com>
 <20190710130615.gvi2jwgr2cds66xr@flea>
 <75719cad-c65c-7ebc-3ea8-98134f86ddc3@gmail.com>
 <4a13f12f-05a7-473e-4e4e-7a7e32d09720@gmail.com>
 <20190710140504.t5lsk36gnn5cdn6b@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190710140504.t5lsk36gnn5cdn6b@flea>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

10.07.2019 17:05, Maxime Ripard пишет:
> On Wed, Jul 10, 2019 at 04:29:19PM +0300, Dmitry Osipenko wrote:
>> This works:
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index 56d36779d213..e5a2f9c8f404 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -182,6 +182,8 @@ drm_connector_pick_cmdline_mode(struct drm_connector *connector)
>>         mode = drm_mode_create_from_cmdline_mode(connector->dev, cmdline_mode);
>>         if (mode)
>>                 list_add(&mode->head, &connector->modes);
>> +       else
>> +               cmdline_mode->specified = false;
> 
> Hmmm, it's not clear to me why that wouldn't be the case.
> 
> If we come back to the beginning of that function, we retrieve the
> cmdline_mode buffer from the connector pointer, that will probably
> have been parsed a first time using drm_mode_create_from_cmdline_mode
> in drm_helper_probe_add_cmdline_mode.
> 
> Now, I'm guessing that the issue is that in
> drm_mode_parse_command_line_for_connector, if we have a named mode, we
> just copy the mode over and set mode->specified.
> 
> And we then move over to do other checks, and that's probably what
> fails and returns, but our drm_cmdline_mode will have been modified.
> 
> I'm not entirely sure how to deal with that though.
> 
> I guess we could allocate a drm_cmdline_mode structure on the stack,
> fill that, and if successful copy over its content to the one in
> drm_connector. That would allow us to only change the content on
> success, which is what I would expect from such a function?
> 
> How does that sound?

I now see that there is DRM_MODE_TYPE_USERDEF flag that is assigned only
for the "cmdline" mode and drm_client_rotation() is the only place in
DRM code that cares about whether mode is from cmdline, hence looks like
it will be more correct to do the following:

diff --git a/drivers/gpu/drm/drm_client_modeset.c
b/drivers/gpu/drm/drm_client_modeset.c
index 56d36779d213..e5b3be9ed689 100644
--- a/drivers/gpu/drm/drm_client_modeset.c
+++ b/drivers/gpu/drm/drm_client_modeset.c
@@ -825,6 +825,7 @@ bool drm_client_rotation(struct drm_mode_set
*modeset, unsigned int *rotation)
 {
        struct drm_connector *connector = modeset->connectors[0];
        struct drm_plane *plane = modeset->crtc->primary;
+       struct drm_display_mode *mode = modeset->mode;
        struct drm_cmdline_mode *cmdline;
        u64 valid_mask = 0;
        unsigned int i;
@@ -859,7 +860,7 @@ bool drm_client_rotation(struct drm_mode_set
*modeset, unsigned int *rotation)
         * simple XOR between the two handle the addition nicely.
         */
        cmdline = &connector->cmdline_mode;
-       if (cmdline->specified) {
+       if (mode->flags & DRM_MODE_TYPE_USERDEF) {
                unsigned int cmdline_rest, panel_rest;
                unsigned int cmdline_rot, panel_rot;
                unsigned int sum_rot, sum_rest;
