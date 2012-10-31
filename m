From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3 0/4] ARM: tegra: Enable SLINK controller driver
Date: Wed, 31 Oct 2012 23:03:41 +0530
Message-ID: <509160F5.9070400@nvidia.com>
References: <1351580726-17350-1-git-send-email-ldewangan@nvidia.com> <509038BA.30600@wwwdotorg.org> <5090E69C.4080108@nvidia.com> <50914C82.5010704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50914C82.5010704@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 31 October 2012 09:36 PM, Stephen Warren wrote:
> On 10/31/2012 02:51 AM, Laxman Dewangan wrote:
>
> I had forgotten about this from when I tested the older SPI driver that
> we ripped out; I had at least compared the registers between U-Boot and
> the kernel with that driver, so I'm pretty sure I didn't make that
> mistake with the old driver.
>
> So, I'll apply your patch series, and send one to add the flash device
> to the Cardhu .dts.

Great  to hear that the spi driver work for you now.

Thanks,
Laxman
