From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: ftrace doesn't work - 1211 upstream kernel
Date: Thu, 13 Dec 2012 10:15:03 +0800
Message-ID: <50C93A27.8080002@gmail.com>
References: <50C86A0D.9060009@gmail.com> <50C877EE.60507@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50C877EE.60507-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Terje, did yo test the ToT(1211) kernel?

Could you tell me which ftrace configs you enabled?
And what is your kernel command line?

Mark
On 12/12/2012 08:26 PM, Terje Bergstr=F6m wrote:
> On 12.12.2012 13:27, Mark Zhang wrote:
>> Hi all,
>>
>> Has anyone tried to use ftrace to debug upstream kernel? I tried tod=
ay
>> but the result is, the serial console hung after ftrace enabled(kern=
el
>> is alive because the Magic SysRq works).
>>
>> My steps are:
>> - Enable CONFIG_FUNCTION_TRACER in kernel config
>> - Enter command: echo 0 > /sys/kernel/debug/tracing/tracing_on;echo
>> function > /sys/kernel/debug/tracing/current_tracer;echo 1 >
>> /proc/sys/kernel/ftrace_dump_on_oops
>> - Then sometimes the serial console hangs right after you entered th=
e
>> command above, or hangs when you try to "cat /sys/kernel/debug/trace=
"
>>
>> I dumped some backtraces(check below, by invoking a system crash
>> manually) and hope it helps:
>=20
> I'm using ftrace to debug host1x driver + tegradrm, running on Tegra2
> ventana. I just rebased them on linux-next, and I use just the events=
,
> not function tracing.
>=20
> echo 1 >/sys/kernel/debug/tracing/events/host1x/enable
> ~/drm/tests/tegra/2d/tegra_2d_tests
> cat /sys/kernel/debug/tracing/trace
>=20
> I get host1x events as expected.
>=20
> Also function tracing works.
>=20
> Terje
>=20
