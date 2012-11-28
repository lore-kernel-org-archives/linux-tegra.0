From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Wed, 28 Nov 2012 09:24:21 -0700
Message-ID: <50B63AB5.4090801@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>   <1353935954-13763-9-git-send-email-tbergstrom@nvidia.com>   <CAPM=9tzvt3J6D3zLPV97w629q62CNhAxX8V+_JZ6kmXxxz5fVg@mail.gmail.com>   <50B46336.8030605@nvidia.com>   <CAPM=9txCuPJcFAfD7Hu5o2BVFK=pVah7B8HhG0ctLCyFPwNEnA@mail.gmail.com>   <50B476E1.4070403@nvidia.com>   <CAPM=9tysiK6LgnQdAwGSYfxnQfgcfRm0+X2tPSAEDxUPt-QZGA@mail.gmail.com>   <50B47DA8.60609@nvidia.com>	<1354011776.1479.31.camel@tellur>   <20121127103739.GA3329@avionic-0098.adnet.avionic-design.de>   <50B4A483.8030305@nvidia.com>   <CAPM=9tz=_0Drx3=Me3EQdPgBvYVGzs6Gnqaw6RBaTLsCG24RAg@mail.gmail.com>   <50B60EFF.1050703@nvidia.com> <1354109602.1479.66.camel@tellur>  <50B61845.6060102@nvidia.com> <1354111565.1479.73.camel@tellur> <50B6237B.8010808@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B6237B.8010808@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Cc: Lucas Stach <dev@lynxeye.de>, Dave Airlie <airlied@gmail.com>, Thierry Reding <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 11/28/2012 07:45 AM, Terje Bergstr=C3=B6m wrote:
> On 28.11.2012 16:06, Lucas Stach wrote:
>> Why do even need/use dma-buf for this use case? This is all one DRM
>> device, even if we separate host1x and gr2d as implementation module=
s.
>=20
> I didn't want to implement dependency to drm gem objects in nvhost, b=
ut
> we have thought about doing that. dma-buf brings quite a lot of
> overhead, so implementing support for gem buffers would make the
> sequence a bit leaner.
>=20
> nvhost already has infra to support multiple memory managers.
>=20
>> So standard way of doing this is:
>> 1. create gem object for pushbuffer
>> 2. create fake mmap offset for gem obj
>> 3. map pushbuf using the fake offset on the drm device
>> 4. at submit time zap the mapping
>>
>> You need this logic anyway, as normally we don't rely on userspace t=
o
>> sync gpu and cpu, but use the kernel to handle the concurrency issue=
s.
>=20
> Taking a step back - 2D streams are actually very short, in the order=
 of
> <100 bytes. Just copying them to kernel space would actually be faste=
r
> than doing MMU operations.

I'm not sure it's a good idea to have one buffer submission mechanism
for the 2D class and another for the 3D/... class, nor to bet that 2D
streams will always be short.
