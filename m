From: Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v1 0/3] Tegra DMA residue improvements
Date: Wed, 07 May 2014 08:38:55 +0200
Message-ID: <5369D4FF.1070004@metafoo.de>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Freeman <cfreeman@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@nvidia.com, vinod.koul@intel.com, dan.j.williams@intel.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/06/2014 11:22 PM, Christopher Freeman wrote:
> A collection of patches to improve Tegra's DMA residual reporting
>

It would be nice if you could, while you are at it, also implement the 
device_salve_caps callback. This will allow clients to automatically pick up 
things like the supported granularity and other things.

- Lars
