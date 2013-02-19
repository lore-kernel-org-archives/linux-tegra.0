From: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: Broken build due to 6aed8ec "drm: review locking for
	drm_fb_helper_restore_fbdev_mode"
Date: Tue, 19 Feb 2013 19:56:07 +0100
Message-ID: <CAKMK7uG=x4ESF_uVUwvK+0kzvsXEgZBtM9Z6_Qrm6keSasoCbA@mail.gmail.com>
References: <5123BADC.2050807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <5123BADC.2050807@wwwdotorg.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Mark Zhang <markz@nvidia.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 19, 2013 at 6:48 PM, Stephen Warren <swarren@wwwdotorg.org> wrote:
> Daniel,
>
> Commit 6aed8ec "drm: review locking for
> drm_fb_helper_restore_fbdev_mode" (now in next-20130218 and later)
> causes build failures for tegra_defconfig. The issue is this part of the
> patch:

You need to yell at Dave Airlie:

https://patchwork.kernel.org/patch/2162391/

Cheers, Daniel

>> diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
>> index 3742bc9..1b6ba2d 100644
>> --- a/drivers/gpu/drm/drm_fb_cma_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_cma_helper.c
>> @@ -389,8 +389,10 @@ EXPORT_SYMBOL_GPL(drm_fbdev_cma_fini);
>>   */
>>  void drm_fbdev_cma_restore_mode(struct drm_fbdev_cma *fbdev_cma)
>>  {
>> +       drm_modeset_lock_all(dev);
>>         if (fbdev_cma)
>>                 drm_fb_helper_restore_fbdev_mode(&fbdev_cma->fb_helper);
>> +       drm_modeset_unlock_all(dev);
>>  }
>>  EXPORT_SYMBOL_GPL(drm_fbdev_cma_restore_mode);
>
> There, there is no "dev" variable, so compile fails.
>
> If I revert this one patch, the build succeeds, although I didn't check
> whether DRM still works after that (e.g. due to any dependencies from
> the rest of the series).



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
