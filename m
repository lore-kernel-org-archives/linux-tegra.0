From: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Mon, 23 Jul 2018 15:43:07 -0400
Message-ID: <215117b3-ca46-ff0e-a494-0fdf674bec8c@gmail.com>
References: <e411faa3-7d42-710f-a18a-a4fdd764b60a@gmail.com>
 <20180723181318.GG13981@sirena.org.uk>
 <95929e34-eeb4-f3a4-daa1-0b89dd60f570@gmail.com> <3459086.gtf8SULmVS@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3459086.gtf8SULmVS@dimapc>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2018 03:20 PM, Dmitry Osipenko wrote:
> On Monday, 23 July 2018 21:37:50 MSK Peter Geis wrote:
>> On 07/23/2018 02:13 PM, Mark Brown wrote:
>>> On Mon, Jul 23, 2018 at 01:58:26PM -0400, Peter Geis wrote:
>>>> SW2 and SW4 use a shared table to provide voltage to the cpu core and
>>>> devices on Tegra hardware.
>>>> Added this table to the cpcap regulator driver as the first step to
>>>> supporting this device on Tegra.
>>>
>>> This also doesn't apply against current code (though it does now parse
>>> OK), please check and resend - make sure you don't have other out of
>>> tree changes and are using an up to date kernel (ideally my regulator
>>> for-next branch) as a base.
>>
>> Good Afternoon,
>>
>> I thought it was my error in the patches being stripped, unfortunately
>> it seems to be a known Gmail behavior.
>> Any ideas on how to get around it?
> 
> Use the "git send-email" instead of email client.
> 
> You need to create and send out patches using git, that will be something like
> this:
> 
> 1) "git format-patch -v1 -2 ..." to make patches
> 2) "git send-email --smtp-server=smtp.gmail.com --smtp-
> user=pgwipeout@gmail.com --smtp-encryption=tls --smtp-server-port=587 --
> suppress-cc=all --confirm=always --to 'Mark Brown <broonie@kernel.org>' --cc
> 'linux-tegra@vger.kernel.org' --cc 'linux-kernel@vger.kernel.org' ...
> 00*.patch" to send out the patches
> 

As always, thanks Dmitry!
Resent through git this time.
