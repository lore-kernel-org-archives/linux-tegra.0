From: Mike Rapoport <mike.rapoport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH RESEND] i2c: tegra: add I2C_FUNC_SMBUS_EMUL to adapter functionality
Date: Sun, 17 Jul 2011 23:22:11 +0300
Message-ID: <CABpLfogpP=q23xnqqaaNSCxKdQkLiQSif-qz+9DLxcVvbrN2rw@mail.gmail.com>
References: <20110711073755.GA8665@gentoodev.compulab.local>
	<CAMbhsRS-REFiAiEnukVtarTx7PRrzLT0BHAHdmuPGqDRRppGtw@mail.gmail.com>
	<20110713215820.GG3369@freya.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110713215820.GG3369-RazCHl0VsYgkUSuvROHNpA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Ben,

On Thu, Jul 14, 2011 at 12:58 AM, Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org> wrote:
> On Mon, Jul 11, 2011 at 12:49:33AM -0700, Colin Cross wrote:
>> On Mon, Jul 11, 2011 at 12:37 AM, =A0<mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org> wrote:
>> > Hi Ben,
>> > This patch has been waiting for quite a long time and I've got no =
response
>> > from you concerning it.
>> > Can you _please_ at last merge it so it'll make to 3.1?
>
> I'll add it to the -next tree tomorrow

Any updates on this?

>> > =A0static const struct i2c_algorithm tegra_i2c_algo =3D {
>> > --
>> > 1.7.3.1
>> >
>> > --
>> > To unsubscribe from this list: send the line "unsubscribe linux-te=
gra" in
>> > the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.ht=
ml
>> >
>>
>> Your mailer added @mike-pc.compulab.local to all of the addresses.
>>
>> Acked-by: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
>>
>> It should go in through Ben's tree.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-i2c"=
 in
>> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>



--=20
Sincerely Yours,
Mike.
