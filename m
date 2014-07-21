From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 1/2] Switch flasher script to subprocess
Date: Mon, 21 Jul 2014 09:42:25 -0600
Message-ID: <53CD34E1.1080705@wwwdotorg.org>
References: <1404322363-11580-1-git-send-email-swarren@wwwdotorg.org>	<53B4935D.8040504@wwwdotorg.org> <CA+G9XgdAAMttS66oscdY15jUns+ojOJ4-ny0eRfFYO6PXBNXCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+G9XgdAAMttS66oscdY15jUns+ojOJ4-ny0eRfFYO6PXBNXCg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <hsienwen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/09/2014 02:38 AM, Vince Hsu wrote:
> Hi Stephen,
> 
> Sometimes I got the following errors with the tegra-uboot-flasher.
> Re-executing the script might work.

Sorry for the slow response; I was on vacation.

...
> downloading miniloader to target at address 0x4000e000 (136920 bytes)...
> miniloader downloaded successfully
> tegrarcm: retreiving platform info
> Traceback (most recent call last):
...
>   File "./tegra-uboot-flasher", line 49, in run
>     subprocess.check_call(cmd, cwd=cd)
>   File "/usr/lib/python2.7/subprocess.py", line 511, in check_call
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['/tmp/tmpcgEOsW/flasher.sh']'
> returned non-zero exit status 1

I have not seen this. The error message simply means that the tegrarcm
binary exited with a non-zero error code. I think you'll need to run the
tegrarcm command under gdb (or add more debug prints) to find out why.
Passing the --debug and --save-work-dir parameters to
tegra-uboot-flasher will help you see exactly which commands and data
files tegra-uboot-flasher is executing, so you can run the same thing
manually.
