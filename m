From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 4/7] drivers/base: Add interface framework
Date: Wed, 14 May 2014 16:34:21 +0200
Message-ID: <20140514143421.GG8790@phenom.ffwll.local>
References: <1399995050-28435-1-git-send-email-thierry.reding@gmail.com>
 <1399995050-28435-5-git-send-email-thierry.reding@gmail.com>
 <20140513175713.GS3908@phenom.ffwll.local>
 <20140513213057.GA7239@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20140513213057.GA7239@mithrandir>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 13, 2014 at 11:31:07PM +0200, Thierry Reding wrote:
> A different solution, which seems to be fairly common for DRM drivers
> for SoCs, is to instantiate a dummy device so that the DRM driver can
> bind to it. This can happen in two forms: add the dummy device directly
> in device tree (which goes against pretty much everything that's been
> preached about device tree in the past) or the dummy device can be
> instantiated in code, which is what the current Tegra DRM/host1x driver
> does.

Actually the dummy device seems to be an acceptable solution and iirc was
even acked by DT maintainers in the last KS. I'm not on top of things, but
iirc the thinking was that a dummy device which just pulls in all the
relevant real bits with phandles is justified in the board file since it
tells you how the board is intended to be used. The justification was that
on SoCs where assigning stuff between v4l and drm is really flexible (e.g.
on omap or so where you can assign the display pipes essentially freely)
the use-case of the board is what matters, and that's a somewhat physical
property of it (i.e. in what kind of device it's sitting.)

So in your case you'd have a fake display and a fake video device which
pulls everything the drm/v4l driver need together. So if the issue is how
to get at a master device I think that's simple to solve.

If the issue otoh is how the various drivers can get at the bus-like
services host1x exposes, then I think a real bus driver makes a lot more
sense. And Greg seems to have ideas about that already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
