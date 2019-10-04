From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH v2 0/7] add Tegra194 XUSB host and pad controller support
Date: Sat, 5 Oct 2019 00:08:39 +0800
Message-ID: <1a52dc83-3342-0cbf-c345-5c7be9602fd4@nvidia.com>
References: <20191004081941.4831-1-jckuo@nvidia.com>
 <20191004122322.GB422178@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004122322.GB422178@kroah.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 10/4/19 8:23 PM, Greg KH wrote:
> On Fri, Oct 04, 2019 at 04:19:34PM +0800, JC Kuo wrote:
>> Hi,
>>
>> This series introduces support for Tegra194 XUSB host and pad
>> controller. Tegra194 XUSB host and pad controller are highly
>> similar to the controllers found on Tegra186. Therefore, it's
>> possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.
>>
>> JC Kuo (7):
>>   xhci: tegra: Parameterize mailbox register addresses
>>   usb: host: xhci-tegra: Add Tegra194 XHCI support
>>   phy: tegra: xusb: Protect Tegra186 soc with config
>>   phy: tegra: xusb: Add Tegra194 support
>>   dt-bindings: phy: tegra: Add Tegra194 support
>>   arm64: tegra: Add XUSB and pad controller on Tegra194
>>   arm64: tegra: Enable XUSB host in P2972-0000 board
> 
> What changed from v1?  You need to put that somewhere, usually in the
> patches themselves, below the --- line.
> 
> Or at the very least, in the cover letter.
> 
> Given that I can't find it anywhere here, I'll expect a v3 with that
> information to be sent soon :(
> 
For the first two patches, v2 is identical to v1, sorry that I didn't describe
in patches. For the patches 3 to 7, the individual patch has "Changes in v2:"
session to describe.
I will submit v3 with patch 1 and 2 updated.

Thanks for the guidance,
JC
