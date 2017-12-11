From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 2/2] drm/tegra: Support disabled CONFIG_PM
Date: Mon, 11 Dec 2017 16:53:56 +0300
Message-ID: <f04f7268-bcf8-feab-bded-88a166b3b474@gmail.com>
References: <85902b42264b094cbf7cf30930f8c0bbccdca1b7.1512947732.git.digetx@gmail.com>
 <02bccd8c39c0e7e9d3c6733e238e291e8297c830.1512947732.git.digetx@gmail.com>
 <20171211101343.GG10671@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171211101343.GG10671@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11.12.2017 13:13, Thierry Reding wrote:
> On Mon, Dec 11, 2017 at 02:19:44AM +0300, Dmitry Osipenko wrote:
>> Add manual HW power management to drivers probe/remove in order to
>> not fail in a case of runtime power management being disabled in kernel
>> config.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/gpu/drm/tegra/dc.c   | 164 +++++++++++++++++++++++++++----------------
>>  drivers/gpu/drm/tegra/dsi.c  | 138 +++++++++++++++++++++---------------
>>  drivers/gpu/drm/tegra/hdmi.c |  90 ++++++++++++++++--------
>>  drivers/gpu/drm/tegra/sor.c  | 103 +++++++++++++++++----------
>>  4 files changed, 310 insertions(+), 185 deletions(-)
> 
> I think that's the wrong way around. We unconditionally select PM on
> 64-bit ARM already, and I think we should do the same on 32-bit ARM.
> There's really no excuse not to enable runtime PM these days.

What is the rational behind enabling PM unconditionally? It is actually a very
useful debug feature when there is something wrong with the PM. It looks like
Tegra DRM driver is the only driver on Tegra that doesn't work properly with PM
being disabled. Please, let's just fix it.
