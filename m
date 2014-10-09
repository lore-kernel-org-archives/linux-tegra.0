From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: venice2: add GK20A GPU DT node
Date: Thu, 9 Oct 2014 16:48:56 +0900
Message-ID: <54363DE8.9030102@nvidia.com>
References: <1412835112-7209-1-git-send-email-acourbot@nvidia.com> <20141009074326.GA1010@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141009074326.GA1010@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/09/2014 04:43 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Thu, Oct 09, 2014 at 03:11:51PM +0900, Alexandre Courbot wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add the device-tree node for the GK20A GPU and leave it disabled by
>> default. It is the responsability of the bootloader to enable it if the
>> VPR registers have been programmed such as the GPU can operate.
>>
>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/tegra124-venice2.dts | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> Are you going to send the corresponding patches for U-Boot to update
> the status property if it's initialized VPR?

Yes. But maybe I should wait until upstream Nouveau actually works 
properly for that? Right now it will probe successfully, but will crash 
as soon as the GPU is used because there still are memory coherency 
problems.
