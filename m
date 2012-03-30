From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] i2c: tegra: Add delay before reset the controller
Date: Fri, 30 Mar 2012 09:54:28 -0600
Message-ID: <4F75D734.3090109@wwwdotorg.org>
References: <1333109179-12445-1-git-send-email-alokc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1333109179-12445-1-git-send-email-alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alok Chauhan <alokc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, omaplinuxkernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/30/2012 06:06 AM, Alok Chauhan wrote:
> In NACK error condition, I2C controller violates
> clock-to-data setup time before stop. In Software,
> because of this reset of controller is happening
> before I2C controller could complete STOP condition.

I'm not quite sure this description is correct. Surely what's happening
is simply that the controller raises the NACK interrupt as soon as it
detects a NACK condition. Then, the controller generates the STOP
condition on the bus correctly. The issue is that if software resets the
controller as soon as the NACK interrupt is raised, this will happen
before the controller has completely delivered the STOP condition onto
the bus, so we need to pause and wait for that?

I think the commit description and comment in the code should be
reworded to describe what I wrote above, assuming it's accurate.

Is there really no idle bit we can poll in the I2C controller to
determine when the STOP has completed, rather than just delaying a
"hard-coded" time? Can I2C SCL clock-stretching affect the amount of
time that must be delayed?
