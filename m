From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: xhci: tegra: Firmware header is little endian
Date: Mon, 3 Sep 2018 15:50:24 +0300
Message-ID: <e0029a43-a8a2-e8dd-c534-6961d80ea132@linux.intel.com>
References: <20180903101808.31559-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903101808.31559-1-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 03.09.2018 13:18, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The XUSB firmware header is in little endian byte order, so make the
> fields __le32 and __le16 instead of u32 and u16 to avoid warnings from
> sparse when the fields are used with the endian-aware __le32_to_cpu()
> and __le16_to_cpu() accessors, respectively.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Thanks, adding to queue

-Mathias
