From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 4/4] drm/tegra: plane: Add custom CSC BLOB property
Date: Tue, 17 Apr 2018 20:31:11 +0300
Message-ID: <3b1c45ee-a48e-0cae-c7bc-b87e792f2b97@gmail.com>
References: <cover.1523880381.git.digetx@gmail.com>
 <dac33c4b27107fee37d187d97187431353fe6afc.1523880381.git.digetx@gmail.com>
 <20180417090144.GZ31310@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180417090144.GZ31310@phenom.ffwll.local>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

On 17.04.2018 12:01, Daniel Vetter wrote:
> On Mon, Apr 16, 2018 at 03:16:28PM +0300, Dmitry Osipenko wrote:
>> This new property allows userspace to apply custom color conversion
>> coefficients per plane, making possible to utilize display controller
>> for color adjustments of a video overlay.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Same here, this needs corresponding userspace:
> 
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 
> And again there's even more people who discussed extending the existing
> color management support for crtcs to planes. I think we definitely want a
> standard interface for this, not each driver doing their own thing.

Could you please point me to where that discussion is happening?
