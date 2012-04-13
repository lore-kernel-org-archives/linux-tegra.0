From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] i2c: tegra: Add delay before reset the controller
Date: Fri, 13 Apr 2012 16:51:20 -0600
Message-ID: <4F88ADE8.4020200@wwwdotorg.org>
References: <1333345982-16595-1-git-send-email-alokc@nvidia.com> <4F7A0500.3060305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F7A0500.3060305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2012 01:58 PM, Stephen Warren wrote:
> On 04/01/2012 11:53 PM, Alok Chauhan wrote:
>> NACK interrupt generated before I2C controller generates
>> the STOP condition on bus. In Software, because of this
>> reset of controller is happening before I2C controller could
>> complete STOP condition. So wait for some time before resetting
>> the controller so that STOP condition has delivered properly on bus.
>>
>> Added delay of 2 clock period before reset the
>> controller in case of NACK error.
>>
>> Signed-off-by: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>

Wolfram, Ben, can this be picked up for 3.5?
