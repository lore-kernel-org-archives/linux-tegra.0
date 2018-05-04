From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 0/5] Support IOMMU for 2d/3d on Tegra30/114
Date: Fri, 4 May 2018 15:03:40 +0300
Message-ID: <94305d59-e778-61b9-f264-8add7853d16c@gmail.com>
References: <20180503234723.4368-1-digetx@gmail.com>
 <20180504105653.GO13459@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180504105653.GO13459@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04.05.2018 13:56, Thierry Reding wrote:
> On Fri, May 04, 2018 at 02:47:18AM +0300, Dmitry Osipenko wrote:
>> Hi,
>>
>> This series enables IOMMU support for 2d/3d HW on Tegra30/114, as a result
>> userspace that uses 2d/3d could work with the active IOMMU.
>>
>> Dmitry Osipenko (5):
>>   drm/tegra: dc: Balance IOMMU group refcounting
>>   drm/tegra: gr2d: Add IOMMU support
>>   drm/tegra: gr3d: Add IOMMU support
>>   ARM: dts: tegra30: Add IOMMU nodes to Host1x and its clients
>>   ARM: dts: tegra114: Add IOMMU nodes to Host1x and its clients
>>
>>  arch/arm/boot/dts/tegra114.dtsi |  5 +++++
>>  arch/arm/boot/dts/tegra30.dtsi  | 14 +++++++++++++
>>  drivers/gpu/drm/tegra/dc.c      | 35 ++++++++++++++++-----------------
>>  drivers/gpu/drm/tegra/dc.h      |  2 +-
>>  drivers/gpu/drm/tegra/drm.h     |  2 +-
>>  drivers/gpu/drm/tegra/gr2d.c    | 31 +++++++++++++++++++++++++++--
>>  drivers/gpu/drm/tegra/gr3d.c    | 27 +++++++++++++++++++++++++
>>  7 files changed, 94 insertions(+), 22 deletions(-)
> 
> Overall I think this is great. No need to resend for the two comments on
> patch 1, I can fix those up when I apply if you have no objections.

No objections from me, thanks.
