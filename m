From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 1/6] dt-bindings: usb: xhci-tegra: Add Tegra186 support
Date: Wed, 13 Feb 2019 17:21:15 +0200
Message-ID: <a9df20d3-ef03-1895-ba54-4f96d36d081e@linux.intel.com>
References: <20190125113013.11447-1-thierry.reding@gmail.com>
 <20190207111432.GC18518@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207111432.GC18518@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07.02.2019 13:14, Thierry Reding wrote:
> On Fri, Jan 25, 2019 at 12:30:08PM +0100, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Extend the bindings to cover the set of features found in Tegra186.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   .../devicetree/bindings/usb/nvidia,tegra124-xusb.txt          | 4 ++++
>>   1 file changed, 4 insertions(+)
> 
> Hi Greg, Mathias,
> 
> do you have any comments on this series or is it good to go into v5.1?
> 

xhci parts look good to me, (patches 2/6 and 3/6)
Sorry about the delay.

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
