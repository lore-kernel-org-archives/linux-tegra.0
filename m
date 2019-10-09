From: JC Kuo <jckuo@nvidia.com>
Subject: Re: [PATCH v3 0/7] add Tegra194 XUSB host and pad controller support
Date: Wed, 9 Oct 2019 10:23:11 +0800
Message-ID: <454e29a6-bf31-c75c-0f29-abd18a4ae071@nvidia.com>
References: <20191004162906.4818-1-jckuo@nvidia.com>
 <20191007110311.GA614644@kroah.com> <20191008112907.GC228118@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008112907.GC228118@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, nkristam@nvidia.com, skomatineni@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 10/8/19 7:29 PM, Thierry Reding wrote:
> On Mon, Oct 07, 2019 at 01:03:11PM +0200, Greg KH wrote:
>> On Sat, Oct 05, 2019 at 12:28:59AM +0800, JC Kuo wrote:
>>> Hi,
>>>
>>> This series introduces support for Tegra194 XUSB host and pad
>>> controller. Tegra194 XUSB host and pad controller are highly
>>> similar to the controllers found on Tegra186. Therefore, it's
>>> possible to resue xhci-tegra.c and xusb-tegra186.c for Tegra194.
>>
>> I've taken patches 1 and 2 through my USB tree.  If you want/need me to
>> take the others, please get acks from those maintainers on them so I can
>> do so.
> 
> I can pick up patches 6 and 7 into the Tegra tree. There are a few
> patches in there already that conflict with the DT changes in this
> series and those will be easier to resolve in the Tegra tree.
> 
> JC, I noticed that you didn't Cc Kishon as the PHY subsystem maintainer.
> Please resend the series with Kishon added in the To: line to make sure
> he sees them and can apply or ack them.
> 
> Given that Greg's already applied patches 1 and 2, maybe leave them out
> of the series.
Thanks Thierry. I will send v4 accordingly.
> 
> Thierry
> 
