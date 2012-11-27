From: Mark Zhang <markz@nvidia.com>
Subject: Re: [PATCH V2] ARM: dt: tegra: cardhu: Add drm components
Date: Tue, 27 Nov 2012 11:22:45 +0800
Message-ID: <50B43205.8020604@nvidia.com>
References: <1353396472-24167-1-git-send-email-markz@nvidia.com> <50B3F886.3090701@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50B3F886.3090701@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On 11/27/2012 07:17 AM, Stephen Warren wrote:
> On 11/20/2012 12:27 AM, Mark Zhang wrote:
>> This patch adds the rgb node which is needed by
>> tegra drm driver.
> 
> This doesn't seem to include all the GPIOs/regulators/... required to
> enable the panel and backlight.
> 

Yep. Actually I don't know much about panel & backlight stuffs and I
don't submit these patches.

For panel supporting, seems right now the "Generic Panel Framework" has
been changed to version 2 and be renamed as "Common Display Framework";
For backlight, Alex's power sequence patch is on the way.

So my patch just adds the rgb node in the dts.

Mark
