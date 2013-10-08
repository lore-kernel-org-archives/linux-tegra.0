From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH] serial: tegra: remove deprecated IRQF_DISABLED
Date: Tue, 8 Oct 2013 12:31:15 +0530
Message-ID: <5253ADBB.2040009@nvidia.com>
References: <1381041017-12806-1-git-send-email-michael.opdenacker@free-electrons.com> <5252EA3F.9090101@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-serial-owner@vger.kernel.org>
In-Reply-To: <5252EA3F.9090101@wwwdotorg.org>
Sender: linux-serial-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "jslaby@suse.cz" <jslaby@suse.cz>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 07 October 2013 10:37 PM, Stephen Warren wrote:
> On 10/06/2013 12:30 AM, Michael Opdenacker wrote:
>> This patch proposes to remove the use of the IRQF_DISABLED flag
>>
>> It's a NOOP since 2.6.35 and it will be removed one day.
> Laxman, care to comment? I'm not sure why the code explicitly specifies
> IRQF_DISABLED if it's already a no-op. Perhaps the code expects
> IRQF_DISABLED to do something, and hence there's some bug that needs to
> be fixed because of it doesn't?
>

We are having this flag in our downstream driver from very long and 
hence this is there when I wrote for the upstream driver. I checked with 
BT without this flag and it worked fine so it is fine to remove this flag.

Acked-by: Laxman Dewangan <ldewangan@nvidia.com>
