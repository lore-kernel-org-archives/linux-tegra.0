From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH v7 0/6] Support NVIDIA Tegra-based Acer A500 and Nexus 7
 devices
Date: Tue, 5 May 2020 17:11:36 +0200
Message-ID: <20200505151136.GA26776@qmqm.qmqm.pl>
References: <20200505022517.30523-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200505022517.30523-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Pedro =?iso-8859-2?Q?=C2ngelo?= <pangelo@void.io>, Matt Merhar <mattmerhar@protonmail.com>, Zack Pearsall <zpearsall@yahoo.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, May 05, 2020 at 05:25:11AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> This series introduces upstream kernel support for Acer Iconia Tab A500
> and ASUS Google Nexus 7 tablet devices. Please review and apply, thanks
> in advance.
> 
> Changelog:
> 
> v7: - This version brings support for a Nexus 7 variant that uses Ti PMIC
>       instead of the Maxim PMIC. Previously we assumed that variant with
>       the Ti PMIC doesn't exist in a wild, but turned out that it was a
>       wrong assumption. In a result the device-trees are separated into
>       more DTSI pieces, which combined together form the final device-tree.
>       Thanks to Zack Pearsall for testing the Ti version!
[...]

Hi Dmitry!

This Ti-based (PM269) version might be very similar to Asus TF300T I have.
I'll have a look on your DT during the weekend.

Best Regards,
Micha³ Miros³aw
