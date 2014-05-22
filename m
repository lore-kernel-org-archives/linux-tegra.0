From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: Cleanup string initializations (char[] instead
 of char *)
Date: Thu, 22 May 2014 23:57:44 +0200
Message-ID: <CACRpkdYJ31oTB4SJJugJU_neFgXVpVBjXs6dpYsCARJmxL=Cmg@mail.gmail.com>
References: <1400337445-25750-1-git-send-email-manuel.schoelling@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1400337445-25750-1-git-send-email-manuel.schoelling@gmx.de>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Manuel_Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, May 17, 2014 at 4:37 PM, Manuel Sch=C3=B6lling
<manuel.schoelling@gmx.de> wrote:

> Initializations like 'char *foo =3D "bar"' will create two variables:=
 a static
> string and a pointer (foo) to that static string. Instead 'char foo[]=
 =3D "bar"'
> will declare a single variable and will end up in shorter
> assembly (according to Jeff Garzik on the KernelJanitor's TODO list).
>
> Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>

At this point of the release cycle I do not dare to apply this.

Please work in Thierry's errors and resend after the merge window.

Yours,
Linus Walleij
