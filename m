From: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: cpu clock change latency
Date: Fri, 23 Sep 2011 09:44:27 -0700
Message-ID: <3C7A7ACA8617D24290826EC008B5CD083E1E2DBCC7@HQMAIL03.nvidia.com>
References: <201109231639.33651.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201109231639.33651.marvin24-Mmb7MZpHnFY@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Marc Dietrich' <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> this improves latency of the GUI. Note that the comment said "us", while the
> cpu transition latency is measured in "ns", so 400 * 1000 would be right.
> 
> So either the comment is wrong (should be 400ns) or the patch is wrong
> (which is unlikely, because it improved latency in the testcase).
> 

You're right, the patch is wrong.  It should be 400us.  So the original code was much closer to the correct value.

The ondemand governor samples at 1000 times the transition latency, so it's not surprising it works fine with the wrong value at least with ondemand.  The interactive governor in android ignores transition latency.

Perhaps a better fix would be to make the hardcoded LATENCY_MULTIPLIER in the ondemand governor a tunable?

-Allen
