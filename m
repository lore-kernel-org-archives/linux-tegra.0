From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Linux hangs on Jetson TX1: Page fault (SMMU translation error
 [--S])
Date: Thu, 5 Jan 2017 18:32:47 +0900
Message-ID: <3f6e74fb-f146-97cc-5988-c01b101220d7@nvidia.com>
References: <20161218032759.GA6457@jirafa.cyrius.com>
 <20170102160844.GA18393@ulmo.ba.sec>
 <20170103010317.GA1373@jirafa.cyrius.com>
 <20170103224743.GB23466@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103224743.GB23466-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/04/2017 07:47 AM, Martin Michlmayr wrote:
> * Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org> [2017-01-02 17:03]:
>> the boot process hangs.
> 
> Ok, so I figured it out.  It's because this commit is missing in 4.9:
> 5e6b9a8 arm64: tegra: Add VDD_GPU regulator to Jetson TX1
> 
>>    [as pointed out by Thierry on IRC, nobody has reported a bug
>>     in the field, but using a new bootloader with a .dtb that
>>     has the incorrect data, it will crash on boot]
> 
> When I apply this patch to 4.9, the system boots successfully.  The
> original tegra-mc page fault is also gone.
> 
> So looks like it's just a matter of waiting for 4.9.1.

This seems to be a bug anyway - if the regulator is missing, probing of
the GPU should fail gracefully and not trigger errors like the one you got.

Looking at what is going wrong there, thanks for the report and for
finding the root cause!
