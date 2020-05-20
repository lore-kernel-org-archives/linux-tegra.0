From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] media: staging: tegra-vde: fix runtime pm imbalance on
 error
Date: Wed, 20 May 2020 18:02:30 +0300
Message-ID: <20200520150230.GC30374@kadam>
References: <20200520095148.10995-1-dinghao.liu@zju.edu.cn>
 <2b5d64f5-825f-c081-5d03-02655c2d9491@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2b5d64f5-825f-c081-5d03-02655c2d9491@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu, devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wed, May 20, 2020 at 01:15:44PM +0300, Dmitry Osipenko wrote:
> 20.05.2020 12:51, Dinghao Liu пишет:
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > it returns an error code. Thus a pairing decrement is needed on
> > the error handling path to keep the counter balanced.
> > 
> > Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> > ---
> >  drivers/staging/media/tegra-vde/vde.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
> > index d3e63512a765..dd134a3a15c7 100644
> > --- a/drivers/staging/media/tegra-vde/vde.c
> > +++ b/drivers/staging/media/tegra-vde/vde.c
> > @@ -777,7 +777,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
> >  
> >  	ret = pm_runtime_get_sync(dev);
> >  	if (ret < 0)
> > -		goto unlock;
> > +		goto put_runtime_pm;
> >  
> >  	/*
> >  	 * We rely on the VDE registers reset value, otherwise VDE
> > 
> 
> Hello Dinghao,
> 
> Thank you for the patch. I sent out a similar patch a week ago [1].
> 
> [1]
> https://patchwork.ozlabs.org/project/linux-tegra/patch/20200514210847.9269-2-digetx@gmail.com/
> 
> The pm_runtime_put_noidle() should have the same effect as yours
> variant, although my variant won't change the last_busy RPM time, which
> I think is a bit more appropriate behavior.

I don't think either patch is correct.  The right thing to do is to fix
__pm_runtime_resume() so it doesn't leak a reference count on error.

The problem is that a lot of functions don't check the return so
possibly we are relying on that behavior.  We may need to introduce a
new function which cleans up properly instead of leaking reference
counts?

Also it's not documented that pm_runtime_get_sync() returns 1 sometimes
on success so it leads to a few bugs.

drivers/gpu/drm/stm/ltdc.c:             ret = pm_runtime_get_sync(ddev->dev);
drivers/gpu/drm/stm/ltdc.c-             if (ret) {
--
drivers/gpu/drm/stm/ltdc.c:             ret = pm_runtime_get_sync(ddev->dev);
drivers/gpu/drm/stm/ltdc.c-             if (ret) {

drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c:  ret = pm_runtime_get_sync(pm->dev);
drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c-  if (ret)

drivers/media/platform/ti-vpe/cal.c:    ret = pm_runtime_get_sync(&pdev->dev);
drivers/media/platform/ti-vpe/cal.c-    if (ret)

drivers/mfd/arizona-core.c:                     ret = pm_runtime_get_sync(arizona->dev);
drivers/mfd/arizona-core.c-                     if (ret != 0)

drivers/remoteproc/qcom_q6v5_adsp.c:    ret = pm_runtime_get_sync(adsp->dev);
drivers/remoteproc/qcom_q6v5_adsp.c-    if (ret)

drivers/spi/spi-img-spfi.c:     ret = pm_runtime_get_sync(dev);
drivers/spi/spi-img-spfi.c-     if (ret)

drivers/usb/dwc3/dwc3-pci.c:    ret = pm_runtime_get_sync(&dwc3->dev);
drivers/usb/dwc3/dwc3-pci.c-    if (ret)

drivers/watchdog/rti_wdt.c:     ret = pm_runtime_get_sync(dev);
drivers/watchdog/rti_wdt.c-     if (ret) {

regards,
dan carpenter

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 99c7da112c95..e280991a977d 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1082,6 +1082,9 @@ int __pm_runtime_resume(struct device *dev, int rpmflags)
 	retval = rpm_resume(dev, rpmflags);
 	spin_unlock_irqrestore(&dev->power.lock, flags);
 
+	if (retval < 0 && rpmflags & RPM_GET_PUT)
+		atomic_dec(&dev->power.usage_count);
+
 	return retval;
 }
 EXPORT_SYMBOL_GPL(__pm_runtime_resume);
