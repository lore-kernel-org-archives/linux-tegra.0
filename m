From: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Fri, 27 Jan 2017 17:09:00 +0100
Message-ID: <20170127160900.GB1928@katana>
References: <20170127083939.20393-1-thierry.reding@gmail.com>
 <20170127083939.20393-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170127083939.20393-2-thierry.reding@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +- nvidia,bpmp-bus-id:
> +    Single-cell integer.
> +    Indicates the I2C bus number this DT node represent, as defined by the
> +    BPMP firmware.

I'd like to get an ack from Rob for this one if vendor-specific bindings
are still the way to go to encode firmware data. I simply don't know.

> +
> +Example:
> +
> +bpmp {
> +	...
> +
> +	i2c {
> +		compatible = "nvidia,tegra186-bpmp-i2c";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		nvidia,bpmp-bus-id = <5>;
> +	};
> +};

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYi3CcAAoJEBQN5MwUoCm2/J4P/RYUoteX9mwn3CA0x+M0m2VR
21MPx4oZRoqhIsdr0bsQlsv6AnJ6LyOpEuTzn3OPhj9tbMfHLBltVT0v2UQrBREr
qzG3+rBYNvNvrTZmId6sMP1gmR4q7jYfhS7hlgGFo4ZkNgz2AC++bT062GHc9WG8
Kun43+EDxjLDMR5H1feRXopwdyBBuvFKvPFIJCyMPmStYQ4WVbLw9vrgPZXBsJUi
n3OuIuTn83izeiNXV+Q/JzytH56WuueinUtDtGwVKYXzVyO3CuLZeZpLqvPEDsOc
TWGubJLPJ9/NnWSN9LJqXPxi3yC+YTJ587Y1hylmYraQMA0gGiTsCir9XhMQBGe5
mO81fmFTPYz9EiUDSLVXjboBJVg5TOHhZN/XWLCFl2v8/WIgm/QLkoeI1W+TP4+I
rEwBDX1g3LCczl8PTgME1a1nBwA99g1i1izTKuX8X0LVUAv9LMM+LwdffoFZpaj+
fquojKsDU+IP1ldPrZr8bv9S3U96oqkXKsu6y8PpB1fuYzosAz62a1MzVD5FYu7c
SMHXPzmikZ7GZgVmUb+BQ+IVKYKQ0A+O43Gv3PLvEPl8tIaZexWzla8onCSe64dp
tH9Hmx5IoX7cBDzIz9FjwBmQFQrzuwCO61Hip4wpxT+OLGDh2LTwSG1cmdZNPyps
HxMYB/QclL7doOqsUTFT
=rmO/
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
