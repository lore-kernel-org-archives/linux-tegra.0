From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] drm/tegra: fix locking of SET_TILING ioctl
Date: Thu, 19 Nov 2015 13:52:02 +0900
Message-ID: <CAAVeFu+xTzYnbXN-xYviOA01HYVm9dfoP3kh-JX8EHYaZG_V_A@mail.gmail.com>
References: <1447312196-11470-1-git-send-email-acourbot@nvidia.com> <20151117100241.GN16848@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20151117100241.GN16848@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Nov 17, 2015 at 7:02 PM, Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 12, 2015 at 04:09:56PM +0900, Alexandre Courbot wrote:
>> drm_gem_object_unreference() now expects obj->dev->struct_mutex to be
>> held. Use the newly-introduced drm_gem_object_unreference_unlocked()
>> which handles locking for us.
>
> This rule has been really old, I simply made the checking more anal in
>
> commit ef4c6270bf2867e2f8032e9614d1a8cfc6c71663
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Thu Oct 15 09:36:25 2015 +0200
>
>     drm/gem: Check locking in drm_gem_object_unreference
>
> With the above added this is:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch

Thanks! Sending an updated version.
