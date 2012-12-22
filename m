From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Subject: Re: [PATCHv4 5/8] drm: tegra: Remove redundant host1x
Date: Sat, 22 Dec 2012 08:50:08 +0200
Message-ID: <50D55820.7030302@nvidia.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <1356089964-5265-6-git-send-email-tbergstrom@nvidia.com> <20121221143614.GA16167@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121221143614.GA16167@avionic-0098.adnet.avionic-design.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@avionic-design.de>
Cc: "airlied@linux.ie" <airlied@linux.ie>, "dev@lynxeye.de" <dev@lynxeye.de>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 21.12.2012 16:36, Thierry Reding wrote:
> On Fri, Dec 21, 2012 at 01:39:21PM +0200, Terje Bergstrom wrote:
>> +static struct platform_driver tegra_drm_platform_driver = {
>> +	.driver = {
>> +		.name = "tegradrm",
> 
> This should be "tegra-drm" to match the module name.

We've actually created two problems.

First is that the device name should match driver name which should
match module name. But host1x doesn't know the module name of tegradrm.

Second problem is that host1x driver creates tegradrm device even if
tegradrm isn't loaded to system.

These mean that the device has to be created in tegra-drm module to have
access to the module name. So instead of just getter, we need a getter
and a setter.

Terje
