From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH 5/5] drm/tegra: Implement page-flipping support
Date: Mon, 11 Feb 2013 19:00:35 +0100
Message-ID: <CAKMK7uG944fp04GCPOu1BHP-guwjPxnru_V6f0ggDbf_36520A@mail.gmail.com>
References: <1358178932-25505-1-git-send-email-thierry.reding@avionic-design.de>
	<CAKMK7uFQKwvEN0j-L=g1UwTzVvtYyqyyBaH8apQnqWPa2sq5vQ@mail.gmail.com>
	<20130116185606.GC28660@avionic-0098.adnet.avionic-design.de>
	<1944869.Bk5ttSU6yt@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1944869.Bk5ttSU6yt@avalon>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Feb 2, 2013 at 12:05 AM, Laurent Pinchart
<laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> wrote:
>> Back to the original topic: should it not work to queue a page flip and
>> immediately exit(0) after that to test the cleanup code? I suppose if
>> that can be tested on all drivers we should have pretty good coverage.
>
> Maybe we need some kind of compliance test suite tool ?

kms_flip from our intel-specific testsuite is probably the most
paranoid thing for testing page flips out there:

http://cgit.freedesktop.org/xorg/app/intel-gpu-tools/tree/tests/kms_flip.c

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
