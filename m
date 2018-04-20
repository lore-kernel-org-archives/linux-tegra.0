From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 4/4] drm/tegra: plane: Add custom CSC BLOB property
Date: Fri, 20 Apr 2018 09:34:04 +0200
Message-ID: <20180420073404.GK31310@phenom.ffwll.local>
References: <cover.1523880381.git.digetx@gmail.com>
 <dac33c4b27107fee37d187d97187431353fe6afc.1523880381.git.digetx@gmail.com>
 <20180417090144.GZ31310@phenom.ffwll.local>
 <3b1c45ee-a48e-0cae-c7bc-b87e792f2b97@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3b1c45ee-a48e-0cae-c7bc-b87e792f2b97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 17, 2018 at 08:31:11PM +0300, Dmitry Osipenko wrote:
> On 17.04.2018 12:01, Daniel Vetter wrote:
> > On Mon, Apr 16, 2018 at 03:16:28PM +0300, Dmitry Osipenko wrote:
> >> This new property allows userspace to apply custom color conversion
> >> coefficients per plane, making possible to utilize display controller
> >> for color adjustments of a video overlay.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > 
> > Same here, this needs corresponding userspace:
> > 
> > https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> > 
> > And again there's even more people who discussed extending the existing
> > color management support for crtcs to planes. I think we definitely want a
> > standard interface for this, not each driver doing their own thing.
> 
> Could you please point me to where that discussion is happening?

https://patchwork.freedesktop.org/patch/209469/

is one I've found, but I think there's other efforts.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
