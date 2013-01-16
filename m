From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC PATCH 0/5] Minor bugfixes for Tegra kernels
Date: Wed, 16 Jan 2013 14:45:00 -0700
Message-ID: <50F71F5C.6020209@wwwdotorg.org>
References: <1358366173-56861-1-git-send-email-jeremya@cs.columbia.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358366173-56861-1-git-send-email-jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/16/2013 12:56 PM, Jeremy C. Andrus wrote:
> From: "Jeremy C. Andrus" <jeremya-eQaUEPhvms7ENvBUuze7eA@public.gmane.org>
> 
> In the course of my research here at Columbia University, I have been
> doing some kernel development on the Google Nexus 7 device. I took the
> time to address most of the compile-time warnings while building the
> Tegra kernel tree using the cross-compiler shipped with Android
> (gcc-4.7), and in doing so I came across a few minor issues.
> 
> This RFC series addresses several minor bugs that I was able to fix
> while suppressing compile warnings. Not knowing exactly where
> to send the patches, I decided to send them primarily to the Tegra
> list serv in hopes that they will find their way to the correct place.
> 
> All 5 patches apply cleanly the kernel/tegra repository hosted by
> Google. I used the commit hash referenced in the Android device tree
> git logs as my HEAD revision: 22b4fcde206e96f57bf0a111403fc3d75532918a
> I belive that this is the revision which corresponds to the prebuilt
> kernel provided in the Jelly Bean release.

I honestly don't know where you should send these patches. I've CC'd
Colin Cross who works on Android in case he can clue us in. I assume
there's a Gerrit instance somewhere for Android that you need to push
these into...

Laxman, can you please check if any of these patches should be applied
to our internal/downstream kernels?

Jeremy, do patches 3 or 4 need to be applied to the mainline kernel? It
may be useful for you to resend those directly to the relevant upstream
subsystem maintainers, after rebasing them onto the latest upstream
code. See Documentation/SubmittingPatches in the mainline kernel.

Thanks for the contributions!
