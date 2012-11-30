From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom@nvidia.com>
Subject: Re: [RFC v2 8/8] drm: tegra: Add gr2d device
Date: Fri, 30 Nov 2012 09:44:36 +0200
Message-ID: <50B863E4.50700@nvidia.com>
References: <50B60EFF.1050703@nvidia.com> <1354109602.1479.66.camel@tellur>
	<50B61845.6060102@nvidia.com> <1354111565.1479.73.camel@tellur>
	<50B6237B.8010808@nvidia.com> <1354115609.1479.91.camel@tellur>
	<50B63A70.8020107@nvidia.com> <1354128408.1479.137.camel@tellur>
	<50B71A28.5060807@nvidia.com> <1354180153.1479.162.camel@tellur>
	<20121129121430.GA3846@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20121129121430.GA3846@avionic-0098.adnet.avionic-design.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 29.11.2012 14:14, Thierry Reding wrote:
> On Thu, Nov 29, 2012 at 10:09:13AM +0100, Lucas Stach wrote:
>> This way you would also be able to construct different handles (like GEM
>> obj or V4L2 buffers) from the same backing nvhost object. Note that I'm
>> not sure how useful this would be, but it seems like a reasonable design
>> to me being able to do so.
> 
> Wouldn't that be useful for sharing buffers between DRM and V4L2 using
> dma-buf? I'm not very familiar with how exactly importing and exporting
> work with dma-buf, so maybe I need to read up some more.

I would still preserve the dma-buf support, for exactly this purpose.

Terje
