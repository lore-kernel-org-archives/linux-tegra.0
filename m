From: Alexandre Courbot <acourbot@nvidia.com>
Subject: Re: [PATCH 0/2] ARM: tegra: roth: pinmux fixes
Date: Tue, 24 Jun 2014 12:57:23 +0900
Message-ID: <53A8F723.5070008@nvidia.com>
References: <1403508779-25896-1-git-send-email-acourbot@nvidia.com> <53A8760D.8080106@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <53A8760D.8080106@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On 06/24/2014 03:46 AM, Stephen Warren wrote:
> On 06/23/2014 01:32 AM, Alexandre Courbot wrote:
>> Two small but important fixes to SHIELD's pinmux configuration.
>> The use of invalid properties caused the pinmux to not be applied
>> at all. Also the setting for sdmmc clock lines resulted in random
>> errors or even the impossibility to probe attached devices.
>
> It might be nice to add Roth's pinmux to:
> https://github.com/NVIDIA/tegra-pinmux-scripts

Certainly - will keep a note to do it sometime soon. Thanks for pointing 
it out.
