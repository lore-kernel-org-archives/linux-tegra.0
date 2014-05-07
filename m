From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v1 3/3] dma: tegra: avoid int overflow for transferred
 count
Date: Wed, 07 May 2014 10:38:59 -0600
Message-ID: <536A61A3.3050601@wwwdotorg.org>
References: <1399411343-12222-1-git-send-email-cfreeman@nvidia.com> <1399411343-12222-4-git-send-email-cfreeman@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399411343-12222-4-git-send-email-cfreeman@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Christopher Freeman <cfreeman@nvidia.com>, ldewangan@nvidia.com, swarren@nvidia.com, vinod.koul@intel.com, dan.j.williams@intel.com
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05/06/2014 03:22 PM, Christopher Freeman wrote:
> bytes_transferred will overflow during long audio playbacks.  Since
> the driver only ever consults this value modulo bytes_requested, store the
> value modulo bytes_requested.

The audio driver may only interpret the value modulo bytes_requested,
but what about other drivers such as the high-speed UART (and SPI?) drivers?

What is the dmaengine API's design requirement here, and what do other
dmaengine drivers do. If it's to store the modulo, then I'm fine with
this change.
