From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V5 0/3] soc/tegra: Add support for IO pads power and voltage
 control
Date: Thu, 19 May 2016 13:23:12 +0530
Message-ID: <573D70E8.3070802@nvidia.com>
References: <1463055706-17744-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463055706-17744-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, airlied@linux.ie, swarren@wwwdotorg.org, jonathanh@nvidia.com
Cc: gnurou@gmail.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi Jon/Thierry,

On Thursday 12 May 2016 05:51 PM, Laxman Dewangan wrote:
> The IO pins of Tegra SoCs are grouped for common control of IO interface
> like setting voltage signal levels and power state of the interface. The
> group is generally referred as IO pads. The power state and voltage control
> of IO pins can be done at IO pads level.
>
> Tegra124 onwards IO pads support the power down state when system is
> active. The voltage levels on IO pads are auto detected on Tegra124/
> Tegra132 but it is not in Tegra210. For Tegra210, the SW need to
> explicitly configure the voltage levels of IO pads
>
> This series add the interface for the IO pad power state and voltage
> configurations. Modifies the client to use new APIs.
> Register the child devices to provide the client interface to configure
> IO pads power state and voltage from Device tree.
>

Any comment on this series?
