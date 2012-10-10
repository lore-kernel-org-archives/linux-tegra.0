From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: rename the file of "sleep-tXX" to "sleep-tegraXX"
Date: Wed, 10 Oct 2012 15:07:33 -0600
Message-ID: <5075E395.4070608@wwwdotorg.org>
References: <1349691837-30488-1-git-send-email-josephl@nvidia.com> <CAOesGMhnYZmEZPdpBDmQ+JYxgZRDXZ97O3Wizy91DwxHZFGWpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMhnYZmEZPdpBDmQ+JYxgZRDXZ97O3Wizy91DwxHZFGWpw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/10/2012 02:54 PM, Olof Johansson wrote:
> On Mon, Oct 8, 2012 at 3:23 AM, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> For the naming consistency under the mach-tegra, we re-name the file of
>> "sleep-tXX" to "sleep-tegraXX" (e.g., sleep-t30 to sleep-tegra30).
>>
>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Why rename? It's just churn.

The CPUs are named TegraNN not TNN, so for consistency the files should
be named that way. This is almost the last instance; everything else got
renamed as a side-effect of adding splitting things up for Tegra30
support. Oh, except tegra2_emc.c which can be renamed whenever it's
moved to an appropriate drivers/ directory.
