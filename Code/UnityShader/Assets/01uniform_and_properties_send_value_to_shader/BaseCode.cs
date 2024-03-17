using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BaseCode : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        this.GetComponent<MeshRenderer>().material.SetVector("secondColor",new Vector4(0.5f,0.5f,0.5f,1));
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
